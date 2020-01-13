FROM katalonstudio/katalon
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash && \
    apt-get -qqy install nodejs jq && \
    npm install -g appium@${APPIUM_VERSION} --unsafe-perm=true --allow-root && \
    exit 0 && \
    npm cache clean && \
    apt-get remove --purge -y npm && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get clean
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
