prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the owner (parsing schema)
-- of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>31247972357692975900
,p_default_application_id=>83204
,p_default_id_offset=>46063286172567668234
,p_default_owner=>'WKSP_RMZRT'
);
end;
/
 
prompt APPLICATION 83204 - APEX Plug-ins by Richard Baldogi - jsoncrack - integration
--
-- Application Export:
--   Application:     83204
--   Name:            APEX Plug-ins by Richard Baldogi - jsoncrack - integration
--   Date and Time:   20:00 Thursday January 5, 2023
--   Exported By:     BALDOGI.RICHARD@REMEDIOS.HU
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 36673340517560423622
--   Manifest End
--   Version:         22.2.0
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/com_apexjsonviewer_plugin
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(36673340517560423622)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.APEXJSONVIEWER.PLUGIN'
,p_display_name=>'JSON Viewer'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- =============================================================================',
'--',
'--  Created by Richard Baldogi',
'--',
'--  This plug-in helps to visualize JSON data in a canvas.',
'--',
'--  License: MIT',
'--',
'--  GitHub: https://github.com/baldogiRichard/apex-jsoncrack-jsonviewer',
'--',
'-- =============================================================================',
'--render',
'function render',
'  ( p_region              in apex_plugin.t_region',
'  , p_plugin              in apex_plugin.t_plugin',
'  , p_is_printer_friendly in boolean',
'  )',
'return apex_plugin.t_region_render_result',
'as',
'    --region and ajax id',
'    l_region_id     p_region.static_id%type    := p_region.static_id;',
'    l_ajax_id       p_region.static_id%type    := apex_plugin.get_ajax_identifier;',
'',
'    l_result        apex_plugin.t_region_render_result;',
'',
'    --region source',
'    l_source                            p_region.source%type   := p_region.source;',
'    l_context                           apex_exec.t_context;',
'',
'    --attributes',
'    l_theme                            p_region.attribute_01%type := p_region.attribute_01;',
'    l_plsql_code                       p_region.attribute_02%type := p_region.attribute_02; ',
'',
'begin',
'',
'    --debug',
'    if apex_application.g_debug',
'    then',
'        apex_plugin_util.debug_region',
'          ( p_plugin => p_plugin',
'          , p_region => p_region',
'          );',
'    end if;',
'',
'    --printing region',
'    sys.htp.p(''<div id="'' || l_region_id || ''"></div>'');',
'',
'    --creating JSON for JS initialization',
'    apex_json.initialize_clob_output;  ',
'',
'    --Add onload code',
'    apex_javascript.add_onload_code(p_code => ''jsonCrack('' || l_theme || '','' || apex_json.get_clob_output || '','' || l_region_id || '');'');',
'',
'    apex_json.free_output;',
'',
'    return l_result;',
'',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_LOCATION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/baldogiRichard/apex-jsoncrack-jsonviewer'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36730997319885304285)
,p_plugin_id=>wwv_flow_imp.id(36673340517560423622)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'PL/SQL code (returning CLOB / VARCHAR2):'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36679283367697512545)
,p_plugin_id=>wwv_flow_imp.id(36673340517560423622)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Theme:'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'light'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(36680287339042184625)
,p_plugin_attribute_id=>wwv_flow_imp.id(36679283367697512545)
,p_display_sequence=>10
,p_display_value=>'Light'
,p_return_value=>'light'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(36679347887937514779)
,p_plugin_attribute_id=>wwv_flow_imp.id(36679283367697512545)
,p_display_sequence=>20
,p_display_value=>'Dark'
,p_return_value=>'dark'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(36679215766245501598)
,p_plugin_id=>wwv_flow_imp.id(36673340517560423622)
,p_name=>'SOURCE_LOCATION'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
