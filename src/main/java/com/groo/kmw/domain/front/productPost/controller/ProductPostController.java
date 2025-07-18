package com.groo.kmw.domain.front.productPost.controller;

import com.groo.kmw.domain.admin.product.entity.Product;
import com.groo.kmw.domain.admin.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/productPost")
public class ProductPostController {

    private final ProductService productService;

    @GetMapping()
    public String list(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10")int size, Model model){
        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = productService.getProductPage(pageable);

        model.addAttribute("productPage", productPage);
        //현재 보고 있는 페이지 번호를 저장 현재 페이지를 강조하거나 이전 다음 버튼 활용할 때 사용
        model.addAttribute("currentPage", page);
        //전체 페이지 수를 저장
        model.addAttribute("totalPages", productPage.getTotalPages());

        return "front/product/productList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model){
        Product productPost = productService.getProduct(id);

        model.addAttribute("product", productPost);
        
        return "front/product/productDetail";
    }
}
