<%@ page import="hansa.ReTweet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ReTweet</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ReTweet List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ReTweet</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ReTweet</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reTweetInstance}">
            <div class="errors">
                <g:renderErrors bean="${reTweetInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${reTweetInstance?.id}" />
                <input type="hidden" name="version" value="${reTweetInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="added">Added:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reTweetInstance,field:'added','errors')}">
                                    <g:datePicker name="added" value="${reTweetInstance?.added}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message">Message:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reTweetInstance,field:'message','errors')}">
                                    <input type="text" id="message" name="message" value="${fieldValue(bean:reTweetInstance,field:'message')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tweet">Tweet:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:reTweetInstance,field:'tweet','errors')}">
                                    <g:select optionKey="id" from="${hansa.Tweet.list()}" name="tweet.id" value="${reTweetInstance?.tweet?.id}" ></g:select>
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
