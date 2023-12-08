package com.green.greengram3.dm;

import com.green.greengram3.common.ResVo;
import com.green.greengram3.dm.model.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class DmService {
    private final DmMapper mapper;

    public List<DmSelVo> getDmAll(DmSelDto dto) {
        return mapper.selDmAll(dto);
    }


    public ResVo postDmMsg(DmMsgInsDto dto) {
        int affectedRows = mapper.insDmMsg(dto);
        return new ResVo(dto.getSeq());
    }
    public List<DmMsgSelVo> getMsgAll(DmMsgSelDto dto) {
        return null;
    }
}
