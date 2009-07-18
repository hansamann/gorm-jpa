<%@ page import="hansa.Tweet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Tweet</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Tweet List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Tweet</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Tweet</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tweetInstance}">
            <div class="errors">
                <g:renderErrors bean="${tweetInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${tweetInstance?.id}" />
                <input type="hidden" name="version" value="${tweetInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="added">Added:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tweetInstance,field:'added','errors')}">
                                    <g:datePicker name="added" value="${tweetInstance?.added}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message">Message:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tweetInstance,field:'message','errors')}">
                                    <input type="text" id="message" name="message" value="${fieldValue(bean:tweetInstance,field:'message')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="retweets">Retweets:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tweetInstance,field:'retweets','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
