import java.util.ArrayList;
import java.util.List;

import com.fcst.boom.common.page.PageList;


public class Test {
	public static void  main(String[] args){
		Role role1 = new Role();
		role1.setName("张三");
		
		Role role2 = new Role();
		role2.setName("李四");
		
		List list = new ArrayList<Role>(){};
		list.add(role1);
		list.add(role2);
		List<Object> objectList = (List<Object>) list;
		PageList<Object> pageList = new PageList<Object>((List<Object>) list, 1, 2, 7);
		System.out.println("----------------运行完成"+pageList.getTotalRow());
		
		
	}
}
