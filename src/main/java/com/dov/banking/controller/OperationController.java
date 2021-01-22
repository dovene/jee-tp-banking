package com.dov.banking.controller;

import com.dov.banking.model.Account;
import com.dov.banking.model.Operation;
import com.dov.banking.repository.AccountJpaRepository;
import com.dov.banking.repository.OperationJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

@Controller
@RequestMapping("/operations")
public class OperationController {

    @Autowired
    OperationJpaRepository operationJpaRepository;

    @Autowired
    AccountJpaRepository accountJpaRepository;

    @GetMapping
    public String list(HttpSession session, Model model) {
        model.addAttribute("operations", operationJpaRepository.findAll());
        return "operations/operations";
    }

    // Add a new account
    @GetMapping("/create")
    public String add(Model model) {
        model.addAttribute("operation", new Operation());
        model.addAttribute("accounts", accountJpaRepository.findAll());
        model.addAttribute("operationsType", Arrays.asList("Retrait","Dépôt"));
        return "operations/addOperation";
    }

    @PostMapping("/create")
    public String addSave(@ModelAttribute Operation operation) {

        Account relatedAccount = accountJpaRepository.findOne(operation.getAccount().getNumber());
        double accountNewBalance = (operation.getType().equals("Retrait"))?
                relatedAccount.getBalance() - operation.getAmount() :
                relatedAccount.getBalance() + operation.getAmount();
        relatedAccount.setBalance(accountNewBalance);

        operationJpaRepository.save(operation);
        accountJpaRepository.save(relatedAccount);
        return "redirect:/operations";
    }

    // Edit a account
    @GetMapping
    @RequestMapping("/edit/{number}")
    public String edit(Model model, @PathVariable("number") Integer number) {
        model.addAttribute("operation", operationJpaRepository.findOne(number));
        model.addAttribute("accounts", accountJpaRepository.findAll());
        model.addAttribute("operationsType", Arrays.asList("Retrait","Depot"));
        return "operations/editOperation";
    }

    @PostMapping("edit/{number}")
    public String editSave(@ModelAttribute Operation operation) {
        operationJpaRepository.save(operation);
        return "redirect:/operations";
    }

    // Delete a  account
    @GetMapping
    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("number") Integer number) {
        operationJpaRepository.delete(number);
        return "redirect:/operations";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}