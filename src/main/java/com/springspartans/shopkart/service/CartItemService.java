package com.springspartans.shopkart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springspartans.shopkart.model.CartItem;
import com.springspartans.shopkart.model.Customer;
import com.springspartans.shopkart.model.Product;
import com.springspartans.shopkart.repository.CartItemRepository;
import com.springspartans.shopkart.repository.ProductRepository;

@Service
public class CartItemService
{
	@Autowired
	private CartItemRepository cartRepo;
	@Autowired
	private ProductRepository prodRepo;
	@Autowired
	private CustomerService customerService;
	
	private int custId;
	
	public List<CartItem> getAllCartItems() {
		Customer customer = customerService.getCustomer();
		this.custId = (customer == null) ? 0 : customer.getId();
		return getAllCartItemsforCustomer(custId);
	}
	
	public CartItem getBySlno(int itemId)
	{
		return cartRepo.findById(itemId).orElse(null);
	}
	
	public List<CartItem> getAllCartItemsforCustomer(int custId)
	{
		List<CartItem> items = cartRepo.findByCustId(custId);
	    return items;
	}
	
	public void incrementQuantity(int itemId)
	{
		CartItem item = cartRepo.findById(itemId).get();
		item.setQuantity(item.getQuantity()+1);
		cartRepo.save(item);
	}
	
	public void deleteCartItem(int itemId)
	{
		cartRepo.deleteById(itemId);
	}
	
	public double getCartItemPrice(int itemId)
	{
		CartItem item = cartRepo.findById(itemId).get();
		Product prod = item.getProduct();
		return prod.getPrice();
	}
	
	public double getCartPrice()
	{
		if (custId == 0)
			return 0;
		List<CartItem> list = getAllCartItemsforCustomer(custId);
		double total = 0;
		Product prod;
		for(CartItem item : list)
		{
			prod = item.getProduct();
			total += prod.getPrice()*item.getQuantity();		
		}
		return total;
	}
	
	public void addToCart(int itemId, Customer cust)
	{
		 Product prod = prodRepo.findById(itemId).orElse(null);
		 if (prod == null) 
		 {
			 System.out.println("Product not found for id: " + itemId);
		     return;
		 }
		 CartItem item=new CartItem();
		 item.setCustomer(cust);
		 item.setProduct(prod);
		 item.setQuantity(1);
		 cartRepo.save(item);
	}
	
}
