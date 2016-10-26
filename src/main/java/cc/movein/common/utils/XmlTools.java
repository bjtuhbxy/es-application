package cc.movein.common.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

/**
 * Jackson工具类
 * 
 * @author geyx
 *
 */
public class XmlTools {
	/**
	 * xml转换成bean
	 * 
	 * @param xmlPath
	 *            xml文件路径
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static <T> T xmlToBean(String xmlPath, Class<T> cls) throws IOException {
		XmlMapper xml = JacksonMapper.getXmlMapper();
		T obj = xml.readValue(new File(xmlPath), cls);
		return obj;
	}

	/**
	 * xml字符串转换成bean
	 * 
	 * @param xmlString
	 *            xml字符串
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static <T> T xmlStringToBean(String xmlString, Class<T> cls) throws IOException {
		XmlMapper xml = JacksonMapper.getXmlMapper();
		T obj = xml.readValue(xmlString, cls);
		return obj;
	}

	/**
	 * xml字符串转换成bean
	 * 
	 * @param xmlString
	 *            xml字符串
	 * @param cls
	 * @param dateFormat
	 *            日期格式
	 * @return
	 * @throws IOException
	 */
	public static <T> T xmlStringToBean(String xmlString, Class<T> cls, String dateFormat) throws IOException {
		XmlMapper xml = JacksonMapper.getXmlMapper(dateFormat);
		T obj = xml.readValue(xmlString, cls);
		return obj;
	}

	/**
	 * xml转换成bean
	 * 
	 * @param xmlFile
	 *            xml文件对象
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static <T> T xmlToBean(File xmlFile, Class<T> cls) throws IOException {
		XmlMapper xml = JacksonMapper.getXmlMapper();
		T obj = xml.readValue(xmlFile, cls);
		return obj;
	}

	/**
	 * xml转换成bean
	 * 
	 * @param xmlInputStream
	 *            xml输入流
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static <T> T xmlToBean(InputStream xmlInputStream, Class<T> cls) throws IOException {
		XmlMapper xml = JacksonMapper.getXmlMapper();
		T obj = xml.readValue(xmlInputStream, cls);
		return obj;
	}

	/**
	 * bean转换成xml
	 * 
	 * @param bean
	 * @return
	 * @throws JsonProcessingException
	 */
	public static <T> String beanToXml(T bean) throws JsonProcessingException {
		XmlMapper xml = JacksonMapper.getXmlMapper();
		String string = xml.writeValueAsString(bean);
		return string;
	}

	static class JacksonMapper {
		/** * can reuse, share globally */
		private static final ObjectMapper object = new ObjectMapper();

		/** * can reuse, share globally */
		private static final XmlMapper xml = new XmlMapper();

		/** * private constructor */
		private JacksonMapper() {
		}

		/** * return a ObjectMapper that is singleton * @return */
		public static ObjectMapper getObjectMapper() {
			return object;
		}

		/** * return a XmlMapper that is singleton * @return */
		public static XmlMapper getXmlMapper() {
			return xml;
		}

		public static XmlMapper getXmlMapper(String dateFormat) {
			SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
			xml.setDateFormat(sdf);
			return xml;
		}
	}
}
