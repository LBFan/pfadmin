package me.pf.modules.system.service.impl;

import me.pf.modules.system.domain.Dict;
import me.pf.modules.system.repository.DictRepository;
import me.pf.modules.system.service.DictService;
import me.pf.modules.system.service.dto.DictDTO;
import me.pf.modules.system.service.mapper.DictMapper;
import me.pf.utils.PageUtils;
import me.pf.utils.QueryHelp;
import me.pf.utils.ValidationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class DictServiceImpl implements DictService {

    @Autowired
    private DictRepository dictRepository;

    @Autowired
    private DictMapper dictMapper;

    @Override
    public Object queryAll(DictDTO dict, Pageable pageable) {
        Page<Dict> page = dictRepository.findAll((root, query, cb) -> QueryHelp.getPredicate(root, dict, cb), pageable);
        return PageUtils.toPage(page.map(dictMapper::toDto));
    }

    @Override
    public DictDTO findById(Long id) {
        Optional<Dict> dict = dictRepository.findById(id);
        ValidationUtil.isNull(dict, "Dict", "id", id);
        return dictMapper.toDto(dict.get());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public DictDTO create(Dict resources) {
        return dictMapper.toDto(dictRepository.save(resources));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Dict resources) {
        Optional<Dict> optionalDict = dictRepository.findById(resources.getId());
        ValidationUtil.isNull(optionalDict, "Dict", "id", resources.getId());
        Dict dict = optionalDict.get();
        resources.setId(dict.getId());
        dictRepository.save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        dictRepository.deleteById(id);
    }
}