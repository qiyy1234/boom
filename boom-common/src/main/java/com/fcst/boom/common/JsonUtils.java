package com.fcst.boom.common;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.JacksonAnnotationIntrospector;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.IOException;
import java.lang.reflect.AnnotatedElement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * json的操作类
 */
public class JsonUtils {
    static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";
    private static final ObjectMapper mapper = new ObjectMapper();

    static {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DEFAULT_FORMAT);
        mapper.setDateFormat(dateFormat);
        mapper.setAnnotationIntrospector(new JacksonAnnotationIntrospector() {
            /**
			 * 
			 */
			private static final long serialVersionUID = 2181852665717223311L;

			@Override
            public Object findSerializer(Annotated a) {
                if (a instanceof AnnotatedMethod) {
                    AnnotatedElement m = a.getAnnotated();
                    DateTimeFormat an = m.getAnnotation(DateTimeFormat.class);
                    if (an != null) {
                        if (!DEFAULT_FORMAT.equals(an.pattern())) {
                            return new JsonSerializer<Date>() {
                                @Override
                                public void serialize(Date value, JsonGenerator gen, SerializerProvider serializers) throws IOException, JsonProcessingException {
                                    String formattedDate = new SimpleDateFormat(DEFAULT_FORMAT).format(value);
                                    gen.writeString(formattedDate);
                                }
                            };
                        }
                    }
                }
                return super.findSerializer(a);
            }
        });
    }

    /**
     * 使用泛型方法，把json字符串转换为相应的JavaBean对象。
     * (1)转换为普通JavaBean：readValue(json,Student.class)
     * (2)转换为List:readValue(json,List.class).但是如果我们想把json转换为特定类型的List，比如List<Student>，就不能直接进行转换了。
     * 因为readValue(json,List.class)返回的其实是List<Map>类型，你不能指定readValue()的第二个参数是List<Student>.class，所以不能直接转换。
     * 我们可以把readValue()的第二个参数传递为Student[].class.然后使用Arrays.asList();方法把得到的数组转换为特定类型的List。
     * (3)转换为Map：readValue(json,Map.class)
     * 我们使用泛型，得到的也是泛型
     *
     * @param content   要转换的JavaBean类型
     * @param valueType 原始json字符串数据
     * @return JavaBean对象
     */
    public static <T> T fromJSON(String content, Class<T> valueType) {
        try {
            return mapper.readValue(content, valueType);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 把JavaBean转换为json字符串
     * (1)普通对象转换：toJson(Student)
     * (2)List转换：toJson(List)
     * (3)Map转换:toJson(Map)
     * 我们发现不管什么类型，都可以直接传入这个方法
     *
     * @param object JavaBean对象
     * @return json字符串
     */
    public static String toJSON(Object object) {
        try {
            return mapper.writeValueAsString(object);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public ObjectMapper getMapper() {
        return mapper;
    }

}

