/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author MinhQuang
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Feedback {
    private int feedbackID;
    private int rating;
    private String comment;
    private Order order;
    private Trip trip;
}
