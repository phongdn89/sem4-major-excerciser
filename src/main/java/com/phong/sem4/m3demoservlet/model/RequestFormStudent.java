package com.phong.sem4.m3demoservlet.model;

public class RequestFormStudent {

    private String id;
    private String code;
    private String name;
    private String birthDay;
    private String phone;
    private String email;
    private String address;
    private String avatar;

    public RequestFormStudent() {
    }

    public RequestFormStudent(String id, String code, String name, String birthDay, String phone, String email, String address, String avatar) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.birthDay = birthDay;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.avatar = avatar;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "RequestFormStudent{" + "id=" + id + ", code=" + code + ", name=" + name + ", birthDay=" + birthDay + ", phone=" + phone + ", email=" + email + ", address=" + address + ", avatar=" + avatar + '}';
    }

}
