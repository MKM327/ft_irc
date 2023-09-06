#include "../includes/Pass.hpp"

Pass::Pass()
{
}

Pass::~Pass() {}

void Pass::execute(Server &server, Client *client)
{

    if (client->getAuthStatus() == AUTHENTICATE)
    {
        Numeric::printNumeric(client, server, ERR_ALREADYREGISTRED());
        return;
    }
    if (client->getParams().empty())
    {
        Numeric::printNumeric(client, server, ERR_NEEDMOREPARAMS(client->getCommand()));
        return;
    }

    client->setParamsEnd();
    if (client->getParams()[0] == server.getPassword())
    {
        client->setAuthStatus(AUTHENTICATE);
        server.messageToClient(client, client, "Password is correct!");
        Numeric::printNumeric(client, server, RPL_WELCOME(client->getNickname(),client->getUsername(),server.getHostname()));
        Numeric::printNumeric(client, server, RPL_YOURHOST(client->getNickname(),server.getHostname()));
        Numeric::printNumeric(client, server, RPL_CREATED(client->getNickname(),server.getCreatedTime()));
    }
    else
        Numeric::printNumeric(client, server, ERR_PASSWDMISMATCH());


}
