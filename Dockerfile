#Tor Middle Relay Dockerfile with Nyx monitoring

#Tor image
FROM dockurr/tor:0.4.8.21

# change to root to install nyx
USER root

# install nyx
RUN apk add --no-cache nyx

# Copy custom torrc configuration
COPY torrc /etc/tor/torrc

# persistant data volume
VOLUME /var/lib/tor

# Expose ORPort and ControlPort
EXPOSE 9001 9051

# Switch back to tor user
USER tor

# Start tor with the custom configuration
ENTRYPOINT ["tor", "-f", "/etc/tor/torrc"]
