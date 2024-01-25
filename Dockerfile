FROM openrouteservice/openrouteservice:v7.1.1

COPY ./volumes.tar.gz .

RUN tar xvjf volumes.tar.gz

RUN rm -rf /home/ors/ors-core/data/graphs
RUN mv ./graphs /home/ors/ors-core/data/graphs

RUN rm -rf /home/ors/ors-core/data/elevation_cache
RUN mv ./elevation_cache /home/ors/ors-core/data/elevation_cache

RUN rm -rf /home/ors/ors-conf
RUN mv ./conf /home/ors/ors-conf

RUN rm -rf /home/ors/ors-core/data/osm_file.pbf
RUN mv ./quebec-latest.osm.pbf /home/ors/ors-core/data/osm_file.pbf

COPY entrypoint.sh .

#RUN sed -i "2i sed -i 's/8080/\$PORT/g' /home/ors/tomcat/conf/server.xml" /home/ors/ors-core/docker-entrypoint.sh
