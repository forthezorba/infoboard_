package com.example.info;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	//web root�� �ƴ� �ܺ� ��ο� �ִ� ���ҽ��� url�� �ҷ��� �� �ֵ��� ����
    //���� localhost:8090/summernoteImage/1234.jpg
    //�� �����ϸ� C:/summernote_image/1234.jpg ������ �ҷ��´�.
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/summernoteImage/**")
                .addResourceLocations("file:///C:/image/upload/");
    }
}
