const Knex = require('knex');
const restify = require('restify');
const errs = require('restify-errors');

const server = restify.createServer({
    name: 'myapp',
    version: '1.0.0'
});

var knex = require('knex')({
    client: 'mssql',
    connection: {
        server: '192.168.0.110\\sqlexpress',
        user: 'sa',
        password: 'abdr',
        database: 'Inventario',

    }
});

server.use(restify.plugins.acceptParser(server.acceptable));
server.use(restify.plugins.queryParser());
server.use(restify.plugins.bodyParser());


server.listen(1780, function () {
    console.log('%s listening at %s', server.name, server.url);
});

//rota listar todos
server.get('/levantamentos', (req, res, next) => {

    knex('Tb_levantamentos').then((dados) => {
        res.send(dados);
    }, next)
});

server.get('/locais/:id', (req, res, next) => {
    const { id } = req.params;
    knex('Tb_Local').where('Id_usuario', id).then((dados) => {
        res.send(dados);
    }, next)
});

server.get('/todosLocais', (req, res, next) => {
    knex('Tb_Local').then((dados) => {
        res.send(dados);
    }, next)
});

server.get('/notificacoes/:id', (req, res, next) => {
    const { id } = req.params;
    knex.raw('execute sp_BuscaNotificacoes '+id).
        then((dados) => {
            res.send(dados);
        }, next)
});


server.get('/patrimonios/:id', (req, res, next) => {
    const { id } = req.params;
    knex.raw('EXECUTE sp_BuscaPatrimonio ' + id)
        .then((dados) => {
            res.send(dados);
        }, next)
});

server.get('/usuarios', (req, res, next) => {

    knex('Tb_Usuario').then((dados) => {
        res.send(dados);
    }, next)
});

server.post('/patrimonios', (req, res, next) => {
    knex('Tb_Patrimonio')
        .insert(req.body)
        .then((dados) => {
            knex('Tb_Patrimonio').max('Id_Bem').then((dados) => {
                res.send(dados);
            }, next)
        }, next)
});
server.get('/locais/percentualconcluido/:idLocal', (req, res, next) => {  
    const { idLocal } = req.params;
    knex.raw('EXECUTE sp_PorcentagemConcluida ' + parseInt(idLocal))
        .then((dados) => {
            res.send(dados);
        }, next)
});


//rota inserir
server.post('/levantamentos', (req, res, next) => {  
    knex.raw('EXECUTE sp_InsertLevantamento ' + req.body['Id_Local'] 
    + ',' + req.body['Nm_Patrimonio'] 
    + ',' + req.body['Id_Levantamento']
    + ',' + req.body['Id_usuario']
    + ',' + req.body['Notificacao']
    + ',' + req.body['Status'])
        .then((dados) => {
            res.send(dados);
        }, next)
});

server.post('/locais', (req, res, next) => {
    knex('Tb_Local')
        .insert(req.body)
        .then((dados_teste) => {
                knex('Tb_Local').max('Id_local').then((dados) => {
                    res.send(dados);
            }, next)
        }, next)
});

server.post('/notificacoes', (req, res, next) => {
    knex('Tb_notificacao')
        .insert(req.body)
        .then((dados) => {
            res.send(dados);
        }, next)
});

server.post('/usuarios', (req, res, next) => {
    knex('Tb_Usuario')
        .insert(req.body)
        .then((dados) => {
            knex('Tb_Usuario').max('Id_usuario').then((dados) => {
                knex('Tb_Usuario').max('Id_usuario').then((dados) => {
                    res.send(dados);
                }, next)
            }, next)
        }, next)
});

server.post('/start', (req, res, next) => {
    knex('Tb_')
        .insert(req.body)
        .then((dados) => {
            knex('Tb_Usuario').max('Id_usuario').then((dados) => {
                knex('Tb_Usuario').max('Id_usuario').then((dados) => {
                    res.send(dados);
                }, next)
            }, next)
        }, next)
});

//rota listar unico
server.post('/usuario', (req, res, next) => {
    const { prontuario } = req.body;
    const { senha } = req.body;
    knex('Tb_Usuario')
        .where({
            'Pt_Usuario': prontuario,
            'Sn_usuario': senha
        })
        .first()
        .then((dados) => {
            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
            res.send(dados);
        }, next)
},);

server.get('/existeusuario/:prontuario', (req, res, next) => {
    const { prontuario } = req.params;
    knex('Tb_Usuario')
        .where({
            'Pt_Usuario': prontuario,
        })
        .first()
        .then((dados) => {
            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
            res.send(dados);
        }, next)
},);

//RELATORIOS
server.get('/relatorionaolocalizado', (req, res, next) => {  
    knex.raw('EXECUTE sp_RelatorioNaoLocalizado')
        .then((dados) => {
            res.send(dados);
        }, next)
});


//rota listar unico
//server.get('/clientes/:id', (req, res, next) => {
//    const { id } = req.params;
//   knex('CLIENTE')
//       .where('ID_Cliente', id)
//       .first()
//       .then((dados) => {
//            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
//           res.send(dados);
//        }, next)
//});

//rota listar todos
//server.get('/medidas', (req, res, next) => {
//
//    knex('MEDIDAS').then((dados) => {
//        res.send(dados);
//    }, next)
//});

//rota listar unico
//server.get('/medidas/:id', (req, res, next) => {
//    const { id } = req.params;
//    knex('MEDIDAS')
//        .where('ID_Cliente', id)
//        .first()
//        .then((dados) => {
//            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
//            res.send(dados);
//       }, next)
//});

//rota inserir
//server.post('/medidas', (req, res, next) => {
//    knex('MEDIDAS')
//        .insert(req.body)
//        .then((dados) => {
//            res.send(dados);
//        }, next)
//});

//rota Update
//server.put('/medidas/:id', (req, res, next) => {
//    const { id } = req.params;
//    knex('MEDIDAS')
//       .update(req.body)
//        .where('ID_Cliente', id)
//        .then((dados) => {
//           if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
//            res.send('Dados Atualizados');
//        }, next)
//});

//rota Deletar
// server.del('/medidas/:id', (req, res, next) => {
//     const { id } = req.params;
//     knex('MEDIDAS')
//         .where('ID_Cliente', id)
//         .delete()
//         .then((dados) => {
//             if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
//             res.send('Dados Excluidos');
//         }, next)
// });
/*
//rota listar unico com varios filtro
server.get('/posts/filtro/:id/:des', (req, res, next) => {
    const { id } = req.params;
    const { des } = req.params;
    knex('CLIENTE')
        .where({
            DESCRICAO: des,
            UF_ID: id
        })
        .first()
        .then((dados) => {
            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
            res.send(dados);
        }, next)
});


//rota Deletar
server.del('/delete/:id', (req, res, next) => {
    const { id } = req.params;
    knex('UF')
        .where('UF_ID', id)
        .delete()
        .then((dados) => {
            if (!dados) return res.send(new errs.BadRequestError('Nada Encontrado'))
            res.send('Dados Excluidos');
        }, next)
});*/

