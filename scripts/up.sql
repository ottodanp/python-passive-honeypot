CREATE TABLE IF NOT EXISTS "remote_hosts"
(
    "remote_host_id" INT          NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "remote_host" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "requests"
(
    "request_id"        INT          NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "request_method"    VARCHAR(255) NOT NULL,
    "request_uri"       VARCHAR      NOT NULL,
    "query_string"      VARCHAR      NOT NULL,
    "request_headers"   VARCHAR      NOT NULL,
    "request_body"      VARCHAR      NOT NULL,
    "acceptable"        BOOLEAN      NOT NULL,
    "remote_host_id" INT,
    "created_at"        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("remote_host_id") REFERENCES "remote_hosts" ("remote_host_id")
);

CREATE TABLE IF NOT EXISTS "authorized_hosts"
(
    "remote_host_id" INT NOT NULL,
    FOREIGN KEY ("remote_host_id") REFERENCES "remote_hosts" ("remote_host_id")
);
