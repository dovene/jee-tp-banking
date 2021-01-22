package com.dov.banking.repository;

import com.dov.banking.model.Account;
import com.dov.banking.model.Operation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OperationJpaRepository extends JpaRepository<Operation, Integer> {
}

