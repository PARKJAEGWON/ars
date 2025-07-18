package com.groo.kmw.domain.admin.product.controller;

import com.groo.kmw.domain.admin.admin.entity.Admin;
import com.groo.kmw.domain.admin.admin.service.AdminService;
import com.groo.kmw.domain.admin.product.dto.request.ProductCreateRequest;
import com.groo.kmw.domain.admin.product.dto.request.ProductUpdateRequest;
import com.groo.kmw.domain.admin.product.entity.Product;
import com.groo.kmw.domain.admin.product.service.ProductService;
import com.groo.kmw.global.jwt.JwtProvider;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/kmw/product")
public class ProductController {

    private final ProductService productService;
    private final JwtProvider jwtProvider;
    private final AdminService adminService;

    //상품 리스트페이지로 이동
    @GetMapping("")
    public String list(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size, Model model){
        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = productService.getProductPage(pageable);

        model.addAttribute("productPage", productPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());

        return "admin/product/adminProductList";
    }

    //상품 상세페이지로 이동
    @GetMapping("/detail")
    public String detail(@RequestParam("id")Long id, Model model){
        Product product = productService.getProduct(id);

        model.addAttribute("product", product);

        return "admin/product/adminProductDetail";
    }

    //상품 등록페이지로 이동
    @GetMapping("/create")
    public String createPage(){
        return "admin/product/adminProductCreate";
    }
    //상품 등록
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute ProductCreateRequest productCreateRequest, BindingResult bindingResult, HttpServletRequest httpServletRequest) {

        if(bindingResult.hasErrors()){
            return "admin/product/adminProductCreate";
        }

        Cookie[] cookies = httpServletRequest.getCookies();
        String adminAccessToken = null;

        if(cookies != null){
            for(Cookie cookie: cookies){
                if(cookie.getName().equals("adminAccessToken")){
                    adminAccessToken = cookie.getValue();
                    break;
                }
            }
        }
        if(adminAccessToken == null){
            return "redirect:/admin/kmw/login";
        }
        try{
            Map<String, Object> claims = jwtProvider.getClaims(adminAccessToken);
            Long adminId = ((Integer) claims.get("adminId")).longValue();
            Admin admin = adminService.findById(adminId);

            if(admin == null){
                return "redirect:/admin/kmw/login";
            }
            this.productService.create(
                    productCreateRequest.getProductCode(),
                    productCreateRequest.getProductName(),
                    productCreateRequest.getProductCategory(),
                    productCreateRequest.getProductMaterial(),
                    productCreateRequest.getProductColor(),
//                    productCreateRequest.getProductStock(),
                    productCreateRequest.getProductPrice(),
                    productCreateRequest.getProductDescription(),
                    productCreateRequest.getMainImage(),
                    productCreateRequest.getDetailImages(),
                    productCreateRequest.getProductGender(),
                    productCreateRequest.isProductIsSeasonal()
            );
//            httpServletRequest.setAttribute("message","상품이 성공적으로 등록되었습니다.");
            return "redirect:/admin/kmw/product";
        }catch (Exception e){
            return "redirect:/admin/kmw/login";
        }
    }
//    @GetMapping("update")
//    public String updatePage(){
//        return "admin/product/adminProductCreate";
//    }
    //상품 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam Long productId){
        try{
            productService.delete(productId);
            return "redirect:/admin/kmw/product";
        }catch(RuntimeException e){
            return "redirect:/admin/kmw/product?error=" + e.getMessage();
        }
    }

    //상품 수정
    @PostMapping("/update")
    public String update(@ModelAttribute ProductUpdateRequest productUpdateRequest, HttpServletRequest httpServletRequest, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "admin/product/adminProductCreate";
        }
        Cookie[] cookies = httpServletRequest.getCookies();
        String adminAccessToken = null;
        if(cookies != null){
            for(Cookie cookie: cookies){
                if(cookie.getName().equals("adminAccessToken")){
                    adminAccessToken = cookie.getValue();
                    break;
                }
            }
        }
        if(adminAccessToken == null){
            return "redirect:/admin/kmw/login";
        }
        try {
            if (!jwtProvider.verify(adminAccessToken)) {
                return "redirect:/admin/kmw/login";
            }
            this.productService.update(
                    productUpdateRequest.getProductId(),
                    productUpdateRequest.getProductName(),
                    productUpdateRequest.getProductPrice(),
                    productUpdateRequest.getProductCategory(),
                    productUpdateRequest.getProductColor(),
                    productUpdateRequest.getProductMaterial(),
                    productUpdateRequest.getProductGender(),
                    productUpdateRequest.isProductIsSeasonal(),
                    productUpdateRequest.getProductDescription()
            );
            return "redirect:/admin/kmw/product/detail?id=" + productUpdateRequest.getProductId();
        } catch (Exception e) {
            httpServletRequest.setAttribute("error", e.getMessage());
            return "redirect:/admin/kmw/product/detail?id=" + productUpdateRequest.getProductId();
        }
    }
}
