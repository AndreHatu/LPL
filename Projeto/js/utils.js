"use strict";
// ----------------------------------------------------------------------------
// Utilitários básicos v1.0.0
// por Carlos Rafael Gimenes das Neves (github.com/carlosrafaelgn)
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Função para remover espaços em branco do começo e do fim das strings
// (Há browsers que não possuem...)
// ----------------------------------------------------------------------------
window.trim = function (str) {
	return str.replace(/^\s+|\s+$/g, "");
}

// ----------------------------------------------------------------------------
// Função para cancelar um evento em JavaScript
// ----------------------------------------------------------------------------
window.cancelEvent = function (evt) {
	if ("isCancelled" in evt)
		evt.isCancelled = true;
	if ("preventDefault" in evt)
		evt.preventDefault();
	if ("stopPropagation" in evt)
		evt.stopPropagation();
	return false;
}

// ----------------------------------------------------------------------------
// Objeto para auxiliar na manipulação da query string da página
//
// Exemplo de utilização, supondo a seguinte URL:
// Teste.html?id=123&nome=Rafael
//
// **** Atenção! Todos os valores em minhaQueryString são strings! ****
//
// var minhaQueryString = parseQueryString();
// var a = minhaQueryString.id;
// var b = minhaQueryString.nome;
//
// ou
//
// var a = minhaQueryString["id"];
// var b = minhaQueryString["nome"];
// ----------------------------------------------------------------------------
window.parseQueryString = function () {
	var i, pair, assoc = {}, keyValues = location.search.substring(1).split("&");
	for (i in keyValues) {
		pair = keyValues[i].split("=");
		if (pair.length > 1) {
			assoc[decodeURIComponent(pair[0].replace(/\+/g, " "))] = decodeURIComponent(pair[1].replace(/\+/g, " "));
		}
	}
	window.queryString = assoc;
	return assoc;
}

// ----------------------------------------------------------------------------
// https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie
// :: cookies.js ::
//
// A complete cookies reader/writer framework with full unicode support.
//
// Revision #1 - September 4, 2014
//
// https://developer.mozilla.org/en-US/docs/Web/API/document.cookie
// https://developer.mozilla.org/User:fusionchess
//
// This framework is released under the GNU Public License, version 3 or later.
// http://www.gnu.org/licenses/gpl-3.0-standalone.html
//
// Modificado por Carlos Rafael Gimenes das Neves
//
// Criando um cookie com validade até o fim da sessão
// Cookies.create("nome", "valor");
//
// Criando um cookie com validade eterna
// Cookies.create("nome", "valor", Infinity);
//
// Criando um cookie com validade de 48 horas
// Cookies.create("nome", "valor", 48);
//
// Criando um cookie com validade até uma data específica
// var dataLimite = new Date(...);
// Cookies.create("nome", "valor", dataLimite);
//
// Obtendo o valor de um cookie (se não existir, retorna null)
// var valor = Cookies.get("nome");
//
// Removendo um cookie
// Cookies.remove("nome");
//
// Verificando se um cookie existe
// if (Cookies.exists("nome")) {
//   ...
// }
//
// Obtendo um array com os nomes de todos os cookies existentes
// var nomes = Cookies.names();
// ----------------------------------------------------------------------------
window.Cookies = {
	create: function (name, value, expires, path, domain, secure) {
		if (!name || /^(?:expires|max\-age|path|domain|secure)$/i.test(name)) return false;
		var exp = "";
		if (expires) {
			switch (expires.constructor) {
				case Number:
					if (expires === Infinity) {
						exp = "; expires=Fri, 31 Dec 9999 23:59:59 GMT";
					} else {
						exp = new Date();
						exp.setTime(exp.getTime() + (expires * 60 * 60 * 1000));
						exp = "; expires=" + exp.toUTCString();
					}
					break;
				case Date:
					exp = "; expires=" + expires.toUTCString();
					break;
				case String:
					exp = "; expires=" + expires;
					break;
			}
		}
		document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + exp + (path ? "; path=" + path : "") + (domain ? "; domain=" + domain : "") + (secure ? "; secure" : "");
		return true;
	},
	get: function (name) {
		return (!name ? null : (decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(name).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null));
	},
	remove: function (name, path, domain) {
		if (!Cookies.exists(name)) return false;
		document.cookie = encodeURIComponent(name) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (path ? "; path=" + path : "") + (domain ? "; domain=" + domain : "");
		return true;
	},
	exists: function (name) {
		if (!name) return false;
		return (new RegExp("(?:^|;\\s*)" + encodeURIComponent(name).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=")).test(document.cookie);
	},
	names: function () {
		var ns = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/);
		for (var len = ns.length, idx = 0; idx < len; idx++) ns[idx] = decodeURIComponent(ns[idx]);
		return ns;
	}
};

// ----------------------------------------------------------------------------
// Objeto para auxiliar na comunicação via Web API
// ----------------------------------------------------------------------------
window.WebAPI = {
	buildException: function (ex) {
		if (ex.message) {
			return { success: false, status: -1, value: "Ocorreu o seguinte erro: " + ex.message, exceptionType: (err.name || "Error") };
		} else {
			return { success: false, status: -1, value: "Ocorreu o seguinte erro: " + ex, exceptionType: (err.name || "Error") };
		}
	},
	buildResponse: function (req) {
		// Faz o condicional dessa forma, pois pode ser que recebamos um status 204 (No Content)
		if (req.status === 200) {
			// Tudo correu bem
			return { success: true, status: req.status, value: JSON.parse(req.responseText) };
		} else if (req.status === 204) {
			// Tudo correu bem
			return { success: true, status: req.status, value: "" };
		} else {
			// Erros são tratados aqui!!!
			var err;
			try {
				err = JSON.parse(req.responseText);
				if (err && err.ExceptionMessage) {
					return { success: false, status: req.status, value: err.ExceptionMessage, exceptionType: (err.ExceptionType || "System.Exception") };
				} else {
					return { success: false, status: req.status, value: "Ocorreu o erro de rede " + req.status, exceptionType: "System.Exception" };
				}
			} catch (ex) {
				return WebAPI.buildException(ex);
			}
		}
	},
	buildFullUrl: function (url, args, start) {
		var name, value, i, fullUrl = url + "?";
		for (i = start; i < args.length; i += 2) {
			if (i !== start) {
				fullUrl += "&";
			}

			name = args[i];
			value = args[i + 1];

			if (name === undefined || name === null) {
				throw "Argumentos inválidos";
			}
			name = name.toString();
			if (!name) {
				throw "Argumentos inválidos";
			}

			if (value === undefined || value === null) {
				value = "";
			} else {
				value = value.toString();
			}

			fullUrl += encodeURIComponent(name) + "=" + encodeURIComponent(value);
		}
		return fullUrl;
	},
	get: function (url, name0, value0) {
		if (!url) {
			throw "URL inválido";
		}

		if (!(arguments.length & 1)) {
			throw "Quantidade de argumentos inválidos";
		}

		var req, fullUrl;

		if (arguments.length > 1) {
			fullUrl = WebAPI.buildFullUrl(url, arguments, 1);
		} else {
			fullUrl = url;
		}

		try {
			// Cria uma requisição AJAX
			req = new XMLHttpRequest();

			// Abre a requisição com o método HTTP GET

			// *** A requisição está sendo aberta em modo síncrono, para facilitar
			// a compreensão! Em um sistema real, convém utilizar o modo assíncrono!
			req.open("get", fullUrl, false);

			// Pede para o servidor devolver dados em JSON
			req.setRequestHeader("Accept", "application/json");

			// Envia a requisição sincronamente
			req.send();

			return WebAPI.buildResponse(req);
		} catch (ex) {
			return WebAPI.buildException(ex);
		}
	},
	getAsync: function (url, callback, name0, value0) {
		if (!url) {
			throw "URL inválido";
		}

		if (!callback) {
			throw "Callback inválido";
		}

		if ((arguments.length & 1)) {
			throw "Quantidade de argumentos inválidos";
		}

		var req, fullUrl, done = false;

		if (arguments.length > 2) {
			fullUrl = WebAPI.buildFullUrl(url, arguments, 2);
		} else {
			fullUrl = url;
		}

		try {
			// Cria uma requisição AJAX
			req = new XMLHttpRequest();

			// Abre a requisição com o método HTTP GET

			// *** A requisição está sendo aberta em modo assíncrono!
			req.open("get", fullUrl, true);

			// Pede para o servidor devolver dados em JSON
			req.setRequestHeader("Accept", "application/json");

			// Configura o callback assíncrono
			req.onreadystatechange = function () {
				if (req.readyState === 4 && !done) {
					done = true;
					callback(WebAPI.buildResponse(req));
				}
			}

			// Envia a requisição assincronamente
			req.send();
		} catch (ex) {
			callback(WebAPI.buildException(ex));
		}
	},
	post: function (url, bodyObject, name0, value0) {
		if (!url) {
			throw "URL inválido";
		}

		if (bodyObject === undefined) {
			throw "Corpo inválido";
		}

		if ((arguments.length & 1)) {
			throw "Quantidade de argumentos inválidos";
		}

		var req, fullUrl;

		if (arguments.length > 2) {
			fullUrl = WebAPI.buildFullUrl(url, arguments, 2);
		} else {
			fullUrl = url;
		}

		try {
			// Cria uma requisição AJAX
			req = new XMLHttpRequest();

			// Abre a requisição com o método HTTP POST

			// *** A requisição está sendo aberta em modo síncrono, para facilitar
			// a compreensão! Em um sistema real, convém utilizar o modo assíncrono!
			req.open("post", fullUrl, false);

			// Configura a requisição para enviar dados JSON através do corpo
			// da mensagem (por onde será enviado o objeto pessoa)
			req.setRequestHeader("Content-type", "application/json; charset=utf-8");

			// Pede para o servidor devolver dados em JSON
			req.setRequestHeader("Accept", "application/json");

			// Envia a requisição sincronamente
			req.send(JSON.stringify(bodyObject));

			return WebAPI.buildResponse(req);
		} catch (ex) {
			return WebAPI.buildException(ex);
		}
	},
	postAsync: function (url, bodyObject, callback, name0, value0) {
		if (!url) {
			throw "URL inválido";
		}

		if (bodyObject === undefined) {
			throw "Corpo inválido";
		}

		if (!callback) {
			throw "Callback inválido";
		}

		if (!(arguments.length & 1)) {
			throw "Quantidade de argumentos inválidos";
		}

		var req, fullUrl, done;

		if (arguments.length > 3) {
			fullUrl = WebAPI.buildFullUrl(url, arguments, 3);
		} else {
			fullUrl = url;
		}

		try {
			// Cria uma requisição AJAX
			req = new XMLHttpRequest();

			// Abre a requisição com o método HTTP POST

			// *** A requisição está sendo aberta em modo síncrono, para facilitar
			// a compreensão! Em um sistema real, convém utilizar o modo assíncrono!
			req.open("post", fullUrl, true);

			// Configura a requisição para enviar dados JSON através do corpo
			// da mensagem (por onde será enviado o objeto pessoa)
			req.setRequestHeader("Content-type", "application/json; charset=utf-8");

			// Pede para o servidor devolver dados em JSON
			req.setRequestHeader("Accept", "application/json");

			// Configura o callback assíncrono
			req.onreadystatechange = function () {
				if (req.readyState === 4 && !done) {
					done = true;
					callback(WebAPI.buildResponse(req));
				}
			}

			// Envia a requisição assincronamente
			req.send(JSON.stringify(bodyObject));
		} catch (ex) {
			callback(WebAPI.buildException(ex));
		}
	}
};
