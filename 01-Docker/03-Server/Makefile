# Mysql NDB Cluster Management Server

include ../common.mk

SERVICE := mysql-ndb-server

PLUGINS := authentication_kerberos_client.so
PLUGINS += authentication_ldap_sasl_client.so
PLUGINS += authentication_oci_client.so
PLUGINS += authentication_webauthn_client.so
PLUGINS += adt_null.so
PLUGINS += auth_socket.so
PLUGINS += component_audit_api_message_emit.so
PLUGINS += component_keyring_file.so
PLUGINS += component_log_filter_dragnet.so
PLUGINS += component_log_sink_json.so
PLUGINS += component_log_sink_syseventlog.so
PLUGINS += component_mysqlbackup.so
PLUGINS += component_query_attributes.so
PLUGINS += component_reference_cache.so
PLUGINS += component_validate_password.so
PLUGINS += connection_control.so
PLUGINS += ddl_rewriter.so
PLUGINS += group_replication.so
PLUGINS += keyring_udf.so
PLUGINS += libpluginmecab.so
PLUGINS += locking_service.so
PLUGINS += mypluglib.so
PLUGINS += mysql_clone.so
PLUGINS += mysql_no_login.so
PLUGINS += rewriter.so
PLUGINS += semisync_master.so
PLUGINS += semisync_replica.so
PLUGINS += semisync_slave.so
PLUGINS += semisync_source.so
PLUGINS += validate_password.so
PLUGINS += version_token.so


LIBS := libfido2.so.1.15.0:libfido2.so.1
LIBS += libssl.so.3:libssl.so
LIBS += libsasl2.so.3.0.0:libsasl2.so.3:libsasl2.so
LIBS += libldap-2.5.so.0.1.13:libldap-2.5.so.0:libldap.so
LIBS += liblber-2.5.so.0.1.13:liblber-2.5.so.0:liblber.so
LIBS += libkrb5support.so.0.1:libkrb5support.so.0:libkrb5support.so
LIBS += libkrb5.so.3.3:libkrb5.so.3:libkrb5.so
LIBS += libk5crypto.so.3.1:libk5crypto.so.3:libk5crypto.so
LIBS += libgssapi_krb5.so.2.2:libgssapi_krb5.so.2:libgssapi_krb5.so
LIBS += libcrypto.so.3:libcrypto.so
LIBS += libcom_err.so.3.0:libcom_err.so.3:libcom_err.so

LIB2S := libmysqlclient.so.24.0.3:libmysqlclient.so.24:libmysqlclient.so

LIB3S := libmysqlclient.a
LIB3S += libmysqlservices.a
LIB3S += libndbclient_static.a


BINS := mysql
BINS += mysqldump
BINS += myisam_ftdump
BINS += mysql_config_editor
BINS += mysqladmin
BINS += mysqlcheck
BINS += mysqldumpslow
BINS += mysqlimport
BINS += mysqlshow
BINS += mysqlslap
BINS += ndb_blob_tool
BINS += ndb_config
BINS += ndb_delete_all
BINS += ndb_desc
BINS += ndb_drop_index
BINS += ndb_drop_table
BINS += ndb_error_reporter
BINS += ndb_import
BINS += ndb_index_stat
BINS += ndb_mgm
BINS += ndb_move_data
BINS += ndb_perror
BINS += ndb_print_backup_file
BINS += ndb_print_file
BINS += ndb_print_frag_file
BINS += ndb_print_schema_file
BINS += ndb_print_sys_file
BINS += ndb_redo_log_reader
BINS += ndb_restore
BINS += ndb_secretsfile_reader
BINS += ndb_select_all
BINS += ndb_select_count
BINS += ndb_show_tables
BINS += ndb_sign_keys
BINS += ndb_size.pl
BINS += ndb_top
BINS += ndb_waiter
BINS += ndbinfo_select_all
BINS += ndbxfrm
BINS += ibd2sdi
BINS += innochecksum
BINS += my_print_defaults
BINS += myisamchk
BINS += myisamlog
BINS += myisampack
BINS += mysql_migrate_keyring
BINS += mysql_secure_installation
BINS += mysql_tzinfo_to_sql
BINS += mysqlbinlog
BINS += mysqld_multi
BINS += mysqld_safe
BINS += perror


SBINS := mysqld
SBINS += mysqld-debug


PRIVATES := libabsl_bad_any_cast_impl.so
PRIVATES += libabsl_bad_optional_access.so
PRIVATES += libabsl_bad_variant_access.so
PRIVATES += libabsl_base.so
PRIVATES += libabsl_city.so
PRIVATES += libabsl_civil_time.so
PRIVATES += libabsl_cord.so
PRIVATES += libabsl_cord_internal.so
PRIVATES += libabsl_cordz_functions.so
PRIVATES += libabsl_cordz_handle.so
PRIVATES += libabsl_cordz_info.so
PRIVATES += libabsl_cordz_sample_token.so
PRIVATES += libabsl_crc32c.so
PRIVATES += libabsl_crc_cord_state.so
PRIVATES += libabsl_crc_cpu_detect.so
PRIVATES += libabsl_crc_internal.so
PRIVATES += libabsl_debugging_internal.so
PRIVATES += libabsl_demangle_internal.so
PRIVATES += libabsl_die_if_null.so
PRIVATES += libabsl_examine_stack.so
PRIVATES += libabsl_exponential_biased.so
PRIVATES += libabsl_failure_signal_handler.so
PRIVATES += libabsl_flags.so
PRIVATES += libabsl_flags_commandlineflag.so
PRIVATES += libabsl_flags_commandlineflag_internal.so
PRIVATES += libabsl_flags_config.so
PRIVATES += libabsl_flags_internal.so
PRIVATES += libabsl_flags_marshalling.so
PRIVATES += libabsl_flags_parse.so
PRIVATES += libabsl_flags_private_handle_accessor.so
PRIVATES += libabsl_flags_program_name.so
PRIVATES += libabsl_flags_reflection.so
PRIVATES += libabsl_flags_usage.so
PRIVATES += libabsl_flags_usage_internal.so
PRIVATES += libabsl_graphcycles_internal.so
PRIVATES += libabsl_hash.so
PRIVATES += libabsl_hashtablez_sampler.so
PRIVATES += libabsl_int128.so
PRIVATES += libabsl_kernel_timeout_internal.so
PRIVATES += libabsl_leak_check.so
PRIVATES += libabsl_log_entry.so
PRIVATES += libabsl_log_flags.so
PRIVATES += libabsl_log_globals.so
PRIVATES += libabsl_log_initialize.so
PRIVATES += libabsl_log_internal_check_op.so
PRIVATES += libabsl_log_internal_conditions.so
PRIVATES += libabsl_log_internal_format.so
PRIVATES += libabsl_log_internal_globals.so
PRIVATES += libabsl_log_internal_log_sink_set.so
PRIVATES += libabsl_log_internal_message.so
PRIVATES += libabsl_log_internal_nullguard.so
PRIVATES += libabsl_log_internal_proto.so
PRIVATES += libabsl_log_severity.so
PRIVATES += libabsl_log_sink.so
PRIVATES += libabsl_low_level_hash.so
PRIVATES += libabsl_malloc_internal.so
PRIVATES += libabsl_periodic_sampler.so
PRIVATES += libabsl_random_distributions.so
PRIVATES += libabsl_random_internal_distribution_test_util.so
PRIVATES += libabsl_random_internal_platform.so
PRIVATES += libabsl_random_internal_pool_urbg.so
PRIVATES += libabsl_random_internal_randen.so
PRIVATES += libabsl_random_internal_randen_hwaes.so
PRIVATES += libabsl_random_internal_randen_hwaes_impl.so
PRIVATES += libabsl_random_internal_randen_slow.so
PRIVATES += libabsl_random_internal_seed_material.so
PRIVATES += libabsl_random_seed_gen_exception.so
PRIVATES += libabsl_random_seed_sequences.so
PRIVATES += libabsl_raw_hash_set.so
PRIVATES += libabsl_raw_logging_internal.so
PRIVATES += libabsl_scoped_set_env.so
PRIVATES += libabsl_spinlock_wait.so
PRIVATES += libabsl_stacktrace.so
PRIVATES += libabsl_status.so
PRIVATES += libabsl_statusor.so
PRIVATES += libabsl_str_format_internal.so
PRIVATES += libabsl_strerror.so
PRIVATES += libabsl_string_view.so
PRIVATES += libabsl_strings.so
PRIVATES += libabsl_strings_internal.so
PRIVATES += libabsl_symbolize.so
PRIVATES += libabsl_synchronization.so
PRIVATES += libabsl_throw_delegate.so
PRIVATES += libabsl_time.so
PRIVATES += libabsl_time_zone.so
PRIVATES += libprotobuf-lite.so.24.4.0
PRIVATES += libprotobuf.so.24.4.0


ICUDTS := cnvalias.icu
ICUDTS += uemoji.icu
ICUDTS += ulayout.icu
ICUDTS += unames.icu


ICUDTBRKS := burmesedict.dict
ICUDTBRKS += char.brk
ICUDTBRKS += cjdict.dict
ICUDTBRKS += de.res
ICUDTBRKS += el.res
ICUDTBRKS += en.res
ICUDTBRKS += en_US.res
ICUDTBRKS += en_US_POSIX.res
ICUDTBRKS += es.res
ICUDTBRKS += fi.res
ICUDTBRKS += fr.res
ICUDTBRKS += it.res
ICUDTBRKS += ja.res
ICUDTBRKS += khmerdict.dict
ICUDTBRKS += ko.res
ICUDTBRKS += laodict.dict
ICUDTBRKS += line.brk
ICUDTBRKS += line_cj.brk
ICUDTBRKS += line_loose.brk
ICUDTBRKS += line_loose_cj.brk
ICUDTBRKS += line_loose_phrase_cj.brk
ICUDTBRKS += line_normal.brk
ICUDTBRKS += line_normal_cj.brk
ICUDTBRKS += line_normal_phrase_cj.brk
ICUDTBRKS += line_phrase_cj.brk
ICUDTBRKS += pt.res
ICUDTBRKS += res_index.res
ICUDTBRKS += root.res
ICUDTBRKS += ru.res
ICUDTBRKS += sent.brk
ICUDTBRKS += sent_el.brk
ICUDTBRKS += sv.res
ICUDTBRKS += thaidict.dict
ICUDTBRKS += title.brk
ICUDTBRKS += word.brk
ICUDTBRKS += word_POSIX.brk
ICUDTBRKS += word_fi_sv.brk
ICUDTBRKS += zh.res
ICUDTBRKS += zh_Hant.res


CHARSETS := Index.xml
CHARSETS += armscii8.xml
CHARSETS += ascii.xml
CHARSETS += cp1250.xml
CHARSETS += cp1251.xml
CHARSETS += cp1256.xml
CHARSETS += cp1257.xml
CHARSETS += cp850.xml
CHARSETS += cp852.xml
CHARSETS += cp866.xml
CHARSETS += dec8.xml
CHARSETS += geostd8.xml
CHARSETS += greek.xml
CHARSETS += hebrew.xml
CHARSETS += hp8.xml
CHARSETS += keybcs2.xml
CHARSETS += koi8r.xml
CHARSETS += koi8u.xml
CHARSETS += latin1.xml
CHARSETS += latin2.xml
CHARSETS += latin5.xml
CHARSETS += latin7.xml
CHARSETS += macce.xml
CHARSETS += macroman.xml
CHARSETS += swe7.xml


ERRORMSGS := bulgarian
ERRORMSGS += czech
ERRORMSGS += danish
ERRORMSGS += dutch
ERRORMSGS += english
ERRORMSGS += estonian
ERRORMSGS += french
ERRORMSGS += german
ERRORMSGS += greek
ERRORMSGS += hungarian
ERRORMSGS += italian
ERRORMSGS += japanese
ERRORMSGS += korean
ERRORMSGS += norwegian
ERRORMSGS += norwegian-ny
ERRORMSGS += polish
ERRORMSGS += portuguese
ERRORMSGS += romanian
ERRORMSGS += russian
ERRORMSGS += serbian
ERRORMSGS += slovak
ERRORMSGS += spanish
ERRORMSGS += swedish
ERRORMSGS += ukrainian


DEBUGS := adt_null.so
DEBUGS += auth_socket.so
DEBUGS += component_audit_api_message_emit.so
DEBUGS += component_keyring_file.so
DEBUGS += component_log_filter_dragnet.so
DEBUGS += component_log_sink_json.so
DEBUGS += component_log_sink_syseventlog.so
DEBUGS += component_mysqlbackup.so
DEBUGS += component_query_attributes.so
DEBUGS += component_reference_cache.so
DEBUGS += component_validate_password.so
DEBUGS += connection_control.so
DEBUGS += ddl_rewriter.so
DEBUGS += group_replication.so
DEBUGS += keyring_udf.so
DEBUGS += libpluginmecab.so
DEBUGS += locking_service.so
DEBUGS += mypluglib.so
DEBUGS += mysql_clone.so
DEBUGS += mysql_no_login.so
DEBUGS += rewriter.so
DEBUGS += semisync_master.so
DEBUGS += semisync_replica.so
DEBUGS += semisync_slave.so
DEBUGS += semisync_source.so
DEBUGS += validate_password.so
DEBUGS += version_token.so


.PHONY: build
build:
	@ $(MAKE) -f ../common.mk $@
	@ $(MAKE) check
	@ source ../.requisites; \
	CURRENT_DIR=$$(pwd); \
	DST_PATH=./src; \
	SRC_PATH=~/tmp/mysql-cluster-$$SOURCE_VERSION-${CPU_ARCH}; \
	mkdir -p $$DST_PATH; \
	for item in $(PLUGINS); do \
		install -D -m 0644 $$SRC_PATH/lib/plugin/$$item $$DST_PATH/lib/plugin/$$item; \
	done; \
	for item in $(DEBUGS); do \
		install -D -m 0644 $$SRC_PATH/lib/plugin/$$item $$DST_PATH/lib/plugin/debug/$$item; \
	done; \
	for item in $(LIBS); do \
		llibs=($$(echo $$item | tr ":" " ")); \
		lib=$${llibs[0]}; \
		liblink=$${llibs[1]}; \
		liblink2=$${llibs[2]}; \
		install -D -m 0644 $$SRC_PATH/lib/private/$$lib $$DST_PATH/lib/private/$$lib; \
		cd $$DST_PATH/lib/private; \
		ln -s $$lib $$liblink; \
		ln -s $$lib $$liblink2; \
		cd $$CURRENT_DIR; \
	done; \
	for item in $(LIB2S); do \
		llibs=($$(echo $$item | tr ":" " ")); \
		lib=$${llibs[0]}; \
		liblink=$${llibs[1]}; \
		liblink2=$${llibs[2]}; \
		install -D -m 0644 $$SRC_PATH/lib/$$lib $$DST_PATH/lib/$$lib; \
		cd $$DST_PATH/lib; \
		ln -s $$lib $$liblink; \
		ln -s $$lib $$liblink2; \
		cd $$CURRENT_DIR; \
	done; \
	for item in libndbclient.so.6.1.0:libndbclient.so; do \
		llibs=($$(echo $$item | tr ":" " ")); \
		lib=$${llibs[0]}; \
		liblink=$${llibs[1]}; \
		install -D -m 0644 $$SRC_PATH/lib/$$lib $$DST_PATH/lib/x86_64-linux-gnu/$$lib; \
		cd $$DST_PATH/lib/x86_64-linux-gnu; \
		ln -s $$lib $$liblink; \
		cd $$CURRENT_DIR; \
	done; \
	for item in $(LIB3S); do \
		install -D -m 0644 $$SRC_PATH/lib/$$item $$DST_PATH/lib/$$item; \
	done; \
	for item in $(BINS); do \
		install -D -m 0755 $$SRC_PATH/bin/$$item $$DST_PATH/bin/$$item; \
	done; \
	for item in $(SBINS); do \
		install -D -m 0755 $$SRC_PATH/bin/$$item $$DST_PATH/sbin/$$item; \
	done; \
	for item in $(CHARSETS); do \
		install -D -m 0644 $$SRC_PATH/share/charsets/$$item $$DST_PATH/share/charsets/$$item; \
	done; \
	for item in $(PRIVATES); do \
		install -D -m 0644 $$SRC_PATH/lib/private/$$item $$DST_PATH/lib/private/$$item; \
	done; \
	for item in $(ICUDTS); do \
		install -D -m 0644 $$SRC_PATH/lib/private/icudt73l/$$item $$DST_PATH/lib/private/icudt73l/$$item; \
	done; \
	for item in $(ICUDTBRKS); do \
		install -D -m 0644 $$SRC_PATH/lib/private/icudt73l/brkitr/$$item $$DST_PATH/lib/private/icudt73l/brkitr/$$item; \
	done; \
	for item in $(ERRORMSGS); do \
		install -D -m 0644 $$SRC_PATH/share/$$item/errmsg.sys $$DST_PATH/share/$$item/errmsg.sys; \
	done; \
	for item in INFO_BIN INFO_SRC; do \
		install -D -m 0644 $$SRC_PATH/docs/$$item $$DST_PATH/share/docs/$$item; \
	done; \
	for item in messages_to_clients.txt messages_to_error_log.txt uninstall_rewriter.sql install_rewriter.sql; do \
		install -D -m 0644 $$SRC_PATH/share/$$item $$DST_PATH/share/mysql-8.4/$$item; \
	done; \
	for item in mysql-log-rotate; do \
		install -D -m 0644 $$SRC_PATH/support-files/$$item $$DST_PATH/share/$$item; \
	done; \
	docker buildx build --no-cache -t $$REGISTRY/$$PROJECT-$(SERVICE):${VERSION} . > .log 2>&1

