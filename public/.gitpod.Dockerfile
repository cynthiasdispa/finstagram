FROM gitpod/workspace-full
USER gitpod
RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sudo sh
RUN echo "my command is running"
git push 