<%@ page import="hansa.ReTweet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ReTweet</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ReTweet List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ReTweet</g:link></span>
        </div>
        <div class="body">
            <h1>Show ReTweet</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reTweetInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Added:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reTweetInstance, field:'added')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Message:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:reTweetInstance, field:'message')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tweet:</td>
                            
                            <td valign="top" class="value"><g:link controller="tweet" action="show" id="${reTweetInstance?.tweet?.id}">${reTweetInstance?.tweet?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${reTweetInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
