package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ListenerSample implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent sce)  {
    	System.out.println("Listener OUT");
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	ServletContext context = sce.getServletContext();
    	Integer count = 0;
    	context.setAttribute("count", count);
    	System.out.println("Listener IN");
    }

}
