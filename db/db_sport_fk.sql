--to use django user table
ALTER TABLE dbo.events ADD CONSTRAINT fk_auth_user_events_root_user_id FOREIGN KEY (root_user_id)
REFERENCES dbo.auth_user (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.users_events ADD CONSTRAINT fk_auth_user_users_events_user_event_id FOREIGN KEY (user_id)
REFERENCES dbo.auth_user (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.users_groups ADD CONSTRAINT fk_auth_user_users_groups_user_group_id FOREIGN KEY (user_id)
REFERENCES dbo.auth_user (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
