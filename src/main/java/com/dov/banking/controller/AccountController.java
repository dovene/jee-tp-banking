package com.dov.banking.controller;

import com.dov.banking.model.Account;
import com.dov.banking.repository.AccountJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/accounts")
public class AccountController {

    @Autowired
    AccountJpaRepository accountJpaRepository;

    @GetMapping
    public String list(HttpSession session, Model model) {
        model.addAttribute("accounts", accountJpaRepository.findAll());
        return "accounts/accounts";
    }

    // Add a new account
    @GetMapping("/create")
    public String add(Model model) {
        model.addAttribute("account", new Account());
        return "accounts/addAccount";
    }

    @PostMapping("/create")
    public String addSave(@ModelAttribute Account account) {
        accountJpaRepository.save(account);
        return "redirect:/accounts";
    }

    // Edit an account
    @GetMapping
    @RequestMapping("/edit/{number}")
    public String edit(Model model, @PathVariable("number") String number) {
        model.addAttribute("account", accountJpaRepository.findOne(number));
        return "accounts/editAccount";
    }

    @PostMapping("edit/{city}")
    public String editSave(@ModelAttribute Account account) {
        accountJpaRepository.save(account);
        return "redirect:/accounts";
    }

    // Delete an  account
    @GetMapping
    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("number") String number) {
        accountJpaRepository.delete(number);
        return "redirect:/accounts";
    }

}