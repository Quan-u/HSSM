package com.quanyou.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.xmlbeans.impl.jam.mutable.MAnnotatedElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.BeanUtil;
import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.po.User;
import com.quanyou.service.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;

	@RequestMapping("/findShopByName")
	public String findShopByName(Model model, String name) {
		if (name != null) {
			List<Shop> list = shopService.findShopByName(name);
			model.addAttribute("shop", list);
			return "shopAll";
		} else {
			return "defeated";
		}
	}

	@RequestMapping("/findAllshangping")
	public String finAll(Model model) {
		List<Shop> list = shopService.findAll();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据销量排序（降序）
	@RequestMapping("/salesDescend")
	public String salesDescend(Model model, HttpSession session) {
		List<Shop> list = shopService.salesDescend();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据新品排序（升序）
	@RequestMapping("/salesAsc")
	public String salesAsc(Model model) {
		List<Shop> list = shopService.salesAsc();
		model.addAttribute("shop", list);
		return "shopAll";

	}

	// 根据新品排序（降序）
	@RequestMapping("/NewProductDescend")
	public String NewProductDescend(Model model) {
		List<Shop> list = shopService.NewProductDescend();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据新品排序（升序）
	@RequestMapping("/NewProductAsc")
	public String NewProductAsc(Model model) {
		List<Shop> list = shopService.NewProductAsc();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据价格排序（降序）
	@RequestMapping("/priceDescend")
	public String priceDescend(Model model) {
		List<Shop> list = shopService.priceDescend();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据价格排序（升序）
	@RequestMapping("/priceAsc")
	public String priceAsc(Model model) {
		List<Shop> list = shopService.priceAsc();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据折扣排序（降序）
	@RequestMapping("/discountDescend")
	public String discountDescend(Model model) {
		List<Shop> list = shopService.discountDescend();
		model.addAttribute("shop", list);
		return "shopAll";
	}

	// 根据折扣排序（升序）
	@RequestMapping("/discountAsc")
	public String discountAsc(Model model) {
		List<Shop> list = shopService.discountAsc();
		model.addAttribute("shop", list);
		return "shopAll";
	}
    //商品详情页面
	@RequestMapping("/findById")
	public String findById(Model model,Integer id) {
		List<Shop> list=shopService.findById(id);
		model.addAttribute("list",list);
		return "product";
		
	}
	// 添加一个商品到购物车
	@RequestMapping("/AddCart")
	public String AddCart(HttpServletRequest request, HttpServletResponse response,Model model,Integer id) {
    if(id!=null) {
     Shop p=shopService.findShopById(id);
    //将商品添加到购物车
     //获取Session对象
    HttpSession session= request.getSession();
    //从session对象中过去购物车对象
    Map<Shop,Integer> cart=(Map<Shop, Integer>) session.getAttribute("cart");
    //如果购物车为null,说明没有商品存储在购物车中，创建出购物车
    if(cart==null) {
    	cart=new HashMap<Shop,Integer>();
    }
    //向购物车中添加商品此count为已在cart内的p所对应的值
    Integer count=cart.put(p, 1);
    //如果商品数量不为空，则商品数量+1，否则添加新的商品信息count表示已经在cart里面的p的所对应的值
    if(count!=null) {
    	cart.put(p, count+1);
    }
    session.setAttribute("cart", cart);
    model.addAttribute("shop",cart);
    
    }
		return "cart";
	}
	
    //删除购物车里的商品
	@RequestMapping("/changeCart")
	public String changeCart(HttpServletRequest request,HttpServletResponse response,Model model,String id) {
		if(id!=null) {
			int count=Integer.parseInt(request.getParameter("count"));
			HttpSession session=request.getSession();
			Map<Shop,Integer> cart=(Map<Shop, Integer>) session.getAttribute("cart");
			Shop p= new Shop();
			p.setId(id);
			if(count!=0) {
				cart.put(p,count);
			}else {
				cart.remove(p);
			}
			model.addAttribute("cart",cart);
			}
		    return "cart";
	}         
	//把购物车里的商品生成订单
	@RequestMapping("/createOrder")
	public String createOrder(HttpServletRequest request,HttpServletResponse response,Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//得到当前用户
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		// 2.从购物车中获取商品信息
		Map<Shop,Integer> map=(Map<Shop, Integer>) session.getAttribute("cart");
		// 3.将数据封装到订单对象中
		Orders order=new Orders();
		try {
			//把 request.getParameterMap()中获取的参数映射到实体类中
			BeanUtils.populate(order, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 订单号
		Date day=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd"); 
		String oId=df.format(day).toString()+String.valueOf((int)(Math.random()*9000+1000));
		//现在时间
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		//orders里的世间
		order.setOrdertime(Timestamp.valueOf(nowTime));
		// 封装订单id
		order.setId(oId);
		// 封装用户信息到订单表
		order.setUser(user);
		for(Shop p:map.keySet()) {
		OrderItem item=new OrderItem();
		item.setOrder(order);
		item.setBuynum(map.get(p));
		item.setP(p);
		order.getOrderItems().add(item);	
		}
		System.out.println(order);
		shopService.addOrder(order);
		//清除session
		session.removeAttribute("cart");
		return "createOrderSuccess";	
	}
	    //shop商品分类
	@RequestMapping(value="/findDrugType1")
	public String findDrugType1(Model model) {
		List<Shop> list=shopService.findDrugType1();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll1";
	}
	@RequestMapping(value="/findDrugType2")
	public String findDrugType2(Model model) {
		List<Shop> list=shopService.findDrugType2();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll2";
	}
	@RequestMapping(value="/findDrugType3")
	public String findDrugType3(Model model) {
		List<Shop> list=shopService.findDrugType3();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll3";
	}
	@RequestMapping(value="/findDrugType4")
	public String findDrugType4(Model model) {
		List<Shop> list=shopService.findDrugType4();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll4";
	}
	@RequestMapping(value="/findDrugType5")
	public String findDrugType5(Model model) {
		List<Shop> list=shopService.findDrugType5();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll5";
	}
	@RequestMapping(value="/findDrugType6")
	public String findDrugType6(Model model) {
		List<Shop> list=shopService.findDrugType6();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll6";
	}
	@RequestMapping(value="/findDrugType7")
	public String findDrugType7(Model model) {
		List<Shop> list=shopService.findDrugType7();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll7";
	}
	@RequestMapping(value="/findDrugType8")
	public String findDrugType8(Model model) {
		List<Shop> list=shopService.findDrugType8();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll8";
	}
	@RequestMapping(value="/findDrugType9")
	public String findDrugType9(Model model) {
		List<Shop> list=shopService.findDrugType9();
		model.addAttribute("shop", list);
		return "shopAllList/shopAll9";
	}
	
	
}