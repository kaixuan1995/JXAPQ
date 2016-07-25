package com.jxapq.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(value={ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface FieldAnnotation {
	String fname();//英文名
	String cname();//中文名
	boolean skipped() default false;//忽略
}
