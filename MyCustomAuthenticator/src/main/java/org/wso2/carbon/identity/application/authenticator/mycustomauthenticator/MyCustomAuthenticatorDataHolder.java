package org.wso2.carbon.identity.application.authenticator.mycustomauthenticator;

import org.wso2.carbon.user.core.service.RealmService;

/**
 * Created by tharindu on 12/9/15.
 */
public class MyCustomAuthenticatorDataHolder {

    private static volatile MyCustomAuthenticatorDataHolder myCustomAuthenticatorDataHolder;
    private static RealmService realmService;


    private MyCustomAuthenticatorDataHolder(){

    }


    public static MyCustomAuthenticatorDataHolder getInstance(){

        if(myCustomAuthenticatorDataHolder == null){

            synchronized (MyCustomAuthenticator.class){
                if(myCustomAuthenticatorDataHolder == null){
                    myCustomAuthenticatorDataHolder = new MyCustomAuthenticatorDataHolder();
                }
            }
        }

        return myCustomAuthenticatorDataHolder;

    }

    public void setRealmService(RealmService realmService){
        this.realmService = realmService;
    }

    public RealmService getRealmService(){
        return realmService;
    }
}
