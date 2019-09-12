FROM ibmcom/websphere-traditional:profile
COPY QMFWebSphere122.war /tmp/QMFWebSphere122.war
EXPOSE 9043
EXPOSE 9443


RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/QMFWebSphere122.war', '[ -appname QMFWebSphere122 -contextroot /QMFWebSphere122 -MapWebModToVH [[ QMFWebSphere122.war QMFWebSphere122.war,WEB-INF/web.xml default_host]]]')"
