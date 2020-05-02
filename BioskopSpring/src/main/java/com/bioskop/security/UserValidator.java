package com.bioskop.security;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.bioskop.repository.KorisnikRepository;

import model.Korisnik;


@Component
public class UserValidator implements Validator {
	
    
    @Autowired
    KorisnikRepository kr;

    public boolean supports(Class<?> aClass) {
        return Korisnik.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        Korisnik k = (Korisnik) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
   
        if (kr.findByUsername(k.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.korisnik.username");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if (kr.findByEmail(k.getEmail()) != null) {
            errors.rejectValue("email", "Duplicate.korisnik.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (k.getPassword().length() < 8 || k.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.korisnik.password");
        }
    }

	@Override
	public <T> Set<ConstraintViolation<T>> validate(T object, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> Set<ConstraintViolation<T>> validateProperty(T object, String propertyName, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> Set<ConstraintViolation<T>> validateValue(Class<T> beanType, String propertyName, Object value,
			Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BeanDescriptor getConstraintsForClass(Class<?> clazz) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T unwrap(Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExecutableValidator forExecutables() {
		// TODO Auto-generated method stub
		return null;
	}
}