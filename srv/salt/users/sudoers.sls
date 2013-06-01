#!py

def run():
    '''
    Manage sudo enabled user adds/removes
    '''

    users_root = []
    [users_root.extend(value) for key,value in pillar.iteritems() if key.startswith('users_add')]

    generated_user_hsd = {}

    for user in users_root:
        generated_user_hsd[user] = {}

        generated_user_hsd[user]['user'] = [
            'present',
            {'fullname' : user},
            {'home' : True},
            {'shell' : '/bin/bash'},
            {'optional_groups' : ['admin','ubuntu','wheel']}
        ]
        generated_user_hsd[user]['ssh_auth'] = [
            'present',
            {'user' : user},
            {'source' : 'salt://users/keys/' + user + '_id_rsa.pub'},
            {'require' : [{'user': user}]}
        ]

    return generated_user_hsd