package org.wso2.carbon.identity.application.authenticator.mycustomauthenticator.internal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.osgi.service.component.ComponentContext;
import org.wso2.carbon.identity.application.authentication.framework.ApplicationAuthenticator;
import org.wso2.carbon.identity.application.authenticator.mycustomauthenticator.MyCustomAuthenticator;
import org.wso2.carbon.identity.application.authenticator.mycustomauthenticator.MyCustomAuthenticatorDataHolder;
import org.wso2.carbon.user.core.service.RealmService;

import java.util.Hashtable;

/**
 * @scr.component name="identity.application.authenticator.mycustomauthenticator.component" immediate="true"
 * @scr.reference name="realm.service"
 * interface="org.wso2.carbon.user.core.service.RealmService"cardinality="1..1"
 * policy="dynamic" bind="setRealmService" unbind="unsetRealmService"
 */
public class MyCustomAuthenticatorServiceComponent {

    private static Log log = LogFactory.getLog(MyCustomAuthenticatorServiceComponent.class);

    protected void activate(ComponentContext ctxt) {

        MyCustomAuthenticator basicAuth = new MyCustomAuthenticator();
        Hashtable<String, String> props = new Hashtable<String, String>();

        ctxt.getBundleContext().registerService(ApplicationAuthenticator.class.getName(), basicAuth, props);

        if (log.isDebugEnabled()) {
            log.info("BasicAuthenticator bundle is activated");
        }
    }

    protected void deactivate(ComponentContext ctxt) {
        if (log.isDebugEnabled()) {
            log.info("BasicAuthenticator bundle is deactivated");
        }
    }

    protected void setRealmService(RealmService realmService) {
        log.debug("Setting the Realm Service");
        MyCustomAuthenticatorDataHolder.getInstance().setRealmService(realmService);
    }

    protected void unsetRealmService(RealmService realmService) {
        log.debug("UnSetting the Realm Service");
        MyCustomAuthenticatorDataHolder.getInstance().setRealmService(null);
    }

    public static RealmService getRealmService() {
        return MyCustomAuthenticatorDataHolder.getInstance().getRealmService();
    }

}
