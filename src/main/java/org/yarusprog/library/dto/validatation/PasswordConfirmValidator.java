package org.yarusprog.library.dto.validatation;

import org.springframework.beans.BeanWrapperImpl;
import org.yarusprog.library.dto.UserDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Objects;

public class PasswordConfirmValidator implements
        ConstraintValidator<PasswordConfirm, Object> {

    private String password;
    private String passwordConfirm;

    @Override
    public void initialize(PasswordConfirm passwordConfirm) {
        this.password = passwordConfirm.password();
        this.passwordConfirm = passwordConfirm.passwordConfirm();

    }

//    @Override
//    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {
//        return false;
//    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext constraintValidatorContext) {
        Object passwordValue = new BeanWrapperImpl(value).getPropertyValue(password);
        Object passwordConfirmValue = new BeanWrapperImpl(value).getPropertyValue(passwordConfirm);

        if (Objects.nonNull(passwordValue)) {
            return passwordValue.equals(passwordConfirmValue);
        } else {
            return false;
        }
    }
}
