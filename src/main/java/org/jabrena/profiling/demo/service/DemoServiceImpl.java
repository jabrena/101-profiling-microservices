package org.jabrena.profiling.demo.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.jabrena.profiling.demo.model.DataContainer;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class DemoServiceImpl implements DemoService {

    List<DataContainer> evilList = Collections.synchronizedList(new ArrayList<DataContainer>());;

    @Override
    public DataContainer getToken() {
        return smartSeedComputing();
    }


    /**
     * A 'SMART' algorithm to provide security in the project.
     */
    private DataContainer smartSeedComputing(){


        for(int i = 1; i <= 10; i++) {
            evilList.add(new DataContainer(RandomStringUtils.randomAlphabetic(100)));
        }

        int randomNum = ThreadLocalRandom.current().nextInt((evilList.size() - 1) + 1);
        return evilList.get(randomNum);
    }

}
