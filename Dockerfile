FROM mhart/alpine-node
COPY . /app
CMD node /app/test.js
EXPOSE  3700