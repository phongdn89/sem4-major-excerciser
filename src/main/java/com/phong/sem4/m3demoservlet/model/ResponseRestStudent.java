/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.phong.sem4.m3demoservlet.entity.Student;
import java.util.List;

/**
 *
 * @author nguoi
 */
public class ResponseRestStudent {

    @Expose
    @SerializedName("total_row")
    private int totalRow;

    @Expose
    @SerializedName("result")
    private List<Student> list;

    public ResponseRestStudent() {
    }

    public ResponseRestStudent(int totalRow, List<Student> list) {
        this.totalRow = totalRow;
        this.list = list;
    }

    public int getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    public List<Student> getList() {
        return list;
    }

    public void setList(List<Student> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "ResponseRestStudent{" + "totalRow=" + totalRow + ", list=" + list + '}';
    }

}
