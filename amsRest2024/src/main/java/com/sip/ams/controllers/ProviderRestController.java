package com.sip.ams.controllers;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sip.ams.entities.Provider;
import com.sip.ams.dtos.ProviderDto;
import com.sip.ams.services.ProviderService;

@RestController
@RequestMapping("/providers")
@CrossOrigin("*")
public class ProviderRestController {

    @Autowired
    private ProviderService providerService;

    @GetMapping
    public List<Provider> findAll() {
        return providerService.findAll();
    }

    @GetMapping("/{providerId}")
    public Provider findOneProvider(@PathVariable Long providerId) {
        return providerService.findOneProvider(providerId);
    }

    @PostMapping
    public Provider create(
             @RequestBody ProviderDto providerDto) throws IOException {
        // Construct the Provider object
                System.out.println("Received create request with parameters:");
        System.out.println("providerDto " + providerDto);
        Provider provider = new Provider();
        provider.setName(providerDto.getName());
        provider.setEmail(providerDto.getEmail());
        provider.setAddress(providerDto.getAddress());
        // Handle the file if needed
        // ...
        return providerService.create(provider);
    }

    @PutMapping("/{providerId}")
    public Provider updateProvider(
            @PathVariable Long providerId,
            @RequestBody ProviderDto providerDto) throws IOException {
        // Construct the Provider object
        Provider provider = new Provider();
        provider.setName(providerDto.getName());
        provider.setEmail(providerDto.getEmail());
        provider.setAddress(providerDto.getAddress());
        // Handle the file if needed
        // ...
        return providerService.update(providerId, provider);
    }

    @DeleteMapping("/{providerId}")
    public Provider deleteProvider(@PathVariable Long providerId) {
        return providerService.delete(providerId);
    }
}