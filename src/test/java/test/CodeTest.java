package test;

import com.wk.entity.Role;
import com.wk.entity.User;
import com.wk.service.RoleService;
import com.wk.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;
import java.util.function.Consumer;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration    //获取web的IOC
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springMVC.xml"})
public class CodeTest {

    @Autowired
    WebApplicationContext context;

    //虚拟mvc，获取到处理后的结果
    MockMvc mockMvc;

    //使用MockMvc需要进行初始化
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Autowired
    private UserService userService;

    @Test
    public void userList(){
        List<User> list = userService.list();
        for (User user : list) {
            System.out.println("user = " + user);
        }
    }
}
