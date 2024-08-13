package com.sip.ams.dtos;

public class ProviderDto {

    private String name;
    
    private String address;

    private String email;

    public ProviderDto() {}

    public ProviderDto(String name, String address, String email) {
        this.name = name;
        this.address = address;
        this.email = email;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }
}