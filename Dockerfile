# Use the official Drupal image as the base image
FROM drupal:latest

# Copy custom theme files into the Drupal themes directory
COPY ./drupal/custom_theme /var/www/html/themes/custom/custom_theme

# Copy custom Apache configuration
COPY ./apache-config/mime.conf /etc/apache2/conf-available/mime.conf

# Enable the custom configuration
RUN a2enconf mime

# Restart Apache
RUN service apache2 restart