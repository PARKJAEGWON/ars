package com.groo.kmw.domain.front.patment.entity;

import com.groo.kmw.domain.front.order.entity.Order;
import com.groo.kmw.global.baseEntity.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Payment extends BaseEntity {

    @OneToOne
    @JoinColumn(name = "order_id")
    private Order order;

//    private String orderId;           //주문번호 oneToone안하는 이유 궁금
//
//    private String paymentKey;        // 토스페이먼츠 결제 키
//
//    private int amount;              //결제 금액
//
//    private String paymentMethod;   //결제 수단
//
//    private String paymentStats;    //결제 상태 (READY, IN_PROGRESS, DONE, CANCELED, ABORTED)
//
//    private String failReason;      //실패 사유

}
