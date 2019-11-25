package com.wk.service.impl;

import com.wk.entity.Resource;
import com.wk.mapper.ResourceMapper;
import com.wk.service.ResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 资源表 服务实现类
 * </p>
 *
 * @author wk
 * @since 2019-11-25
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

}
