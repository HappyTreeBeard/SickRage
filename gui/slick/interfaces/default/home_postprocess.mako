<%!
    global header="Post Processing"
    global title="Post Processing"


    global topmenu="home"
%>
<%!import os.path%>
<%!include file="/inc_top.mako"/>
<div id="content800">
% if not header is UNDEFINED:
    <h1 class="header">${header}</h1>
% else:
    <h1 class="title">${title}</h1>
% endif

<div id="postProcess">
    <form name="processForm" method="post" action="processEpisode" style="line-height: 40px;">
    <table>
        <input type="hidden" id="type" name="type" value="manual">
        <tr>
            <td style="padding-right:10px;">
                <b>Enter the folder containing the episode:</b>
            </td>
            <td>
                <input type="text" name="dir" id="episodeDir" class="form-control form-control-inline input-sm input350" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Process Method to be used:</b>
            </td>
            <td>
                <select name="process_method" id="process_method" class="form-control form-control-inline input-sm" >
                <% process_method_text = {'copy': "Copy", 'move': "Move", 'hardlink': "Hard Link", 'symlink' : "Symbolic Link"} %>
                % for curAction in ('copy', 'move', 'hardlink', 'symlink'):
                    % if sickbeard.PROCESS_METHOD == curAction:
                        % process_method = "selected=\"selected\""
                    % else:
                        <% process_method = "" %>
                    % endif
                    <option value="${curAction}" ${process_method}>${process_method_text[curAction]}</option>
                % endfor
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <b>Force already Post Processed Dir/Files:</b>
            </td>
            <td>
                <input id="force" name="force" type="checkbox">
            </td>
        </tr>
        <tr>
            <td>
                <b>Mark Dir/Files as priority download:</b>
            </td>
            <td>
                <input id="is_priority" name="is_priority" type="checkbox">
                <span style="line-height: 0; font-size: 12px;"><i>&nbsp;(Check it to replace the file even if it exists at higher quality)</i></span>
            </td>
        </tr>
        <tr>
            <td>
                <b>Delete files and folders:</b>
            </td>
            <td>
                <input id="delete_on" name="delete_on" type="checkbox">
                <span style="line-height: 0; font-size: 12px;"><i>&nbsp;(Check it to delete files and folders like auto processing)</i></span>
            </td>
        </tr>
        % if sickbeard.USE_FAILED_DOWNLOADS:
        <tr>
            <td>
                <b>Mark download as failed:</b>
            </td>
            <td>
                <input id="failed" name="failed" type="checkbox">
            </td>
        </tr>
        % endif
    </table>
        <input id="submit" class="btn" type="submit" value="Process" />
    </form>

<script type="text/javascript" charset="utf-8">
<!--
    jQuery('#episodeDir').fileBrowser({ title: 'Select Unprocessed Episode Folder', key: 'postprocessPath' });
//-->
</script>
</div>

<%!include file="/inc_bottom.mako"/>
