package test;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    @Autowired
    private RoleService roleService;

    @Test
    public void userList(){
        IPage<User> page = new Page<User>(0,2);
        IPage<User> pages = userService.page(page);
        List<User> list = page.getRecords();
        for (User user : list) {
            System.out.println("user = " + user);
        }
    }

    @Test
    public void getColumn(){
        QueryWrapper<User> wrapper = new QueryWrapper<User>()
                .select("user_name");
        List<User> list = userService.list(wrapper);
        for (User user : list) {
            System.out.println("user = " + user);
        }
    }

    @Test
    public void testRole(){
        List<String> strings = roleService.queryRoleByUserId(1);
        for (String str : strings) {
            System.out.println("str = " + str);
        }
    }
}
