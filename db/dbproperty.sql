
DROP TABLE IF EXISTS property_details;


CREATE TABLE property_details(
  id SERIAL8,
  address VARCHAR(255),
  value INT8,
  bedroom_number INT8,
  year INT8,
  status VARCHAR(255),
  size INT8,
  type VARCHAR(255)
);
