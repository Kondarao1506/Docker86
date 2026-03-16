FROM node:20
WORKDIR /opt/server
COPY pom.xml .
COPY src ./src
RUN npm install
RUN mvn clean package 
RUN mv target/shipping-1.0.jar shipping.jar 
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
    
#ExecStart=/bin/java -jar /app/shipping.jar
CMD ["java","-jar","shipping.jar"]