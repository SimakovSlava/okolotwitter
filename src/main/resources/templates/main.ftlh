<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout/>
    </div>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Enter your message"/>
            <input type="text" name="tag" placeholder="Tag">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit">Add</button>
        </form>
    </div>

    <div>List of messages:</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Search</button>
    </form>
    <#list messages as massage>
        <div>
            <b>${massage.id}</b>
            <span>${massage.text}</span>
            <i>${massage.tag}</i>
            <strong>${massage.authorName}</strong>
        </div>
    <#else>
        No messages
    </#list>
</@c.page>