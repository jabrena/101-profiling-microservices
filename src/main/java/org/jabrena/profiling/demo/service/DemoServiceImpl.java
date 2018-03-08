package org.jabrena.profiling.demo.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.jabrena.profiling.demo.model.DataContainer;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class DemoServiceImpl implements DemoService {


    @Override
    public DataContainer getToken() {
        return smartSeedComputing();
    }

    private DataContainer smartSeedComputing(){

        List<DataContainer> evilList = new ArrayList<>();

        for(int i = 1; i <= 10; i++) {
            evilList.add(new DataContainer(RandomStringUtils.randomAlphabetic(100)));
        }

        //int index = ThreadLocalRandom.current().nextInt(1, evilList.size());
        return evilList.get(0);
    }
}
