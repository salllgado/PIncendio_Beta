//
//  anexosData.swift
//  PIncendio Beta
//
//  Created by Chrystian on 24/12/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import Foundation

struct anexosData {
    
    static var ocupacao: [String] = ["A1 - Habitação Uni-Familiar", "A2 - Habitação Multi-Familiar","A3 - Habitação Coletiva", "B - Hoteis e Assemelhados", "C1 - Comercio com Baixa Carga de Incêndio", "C2 - Comercio com Media ou Alta Carga de Incêndio", "C3 - Centro de Compras", "D1 - Local de Prestação de Serviço", "D2 - Agências Bancárias", "D3 - Serviço de Reparação", "D4 - Laboratórios", "E1, E2 - Escolas em Geral (Fundámental e Médio)" ,"E3 - Espaço para cultura Física", "E4 - Centro de Treinamento Profissional " ,"E5 - Pré Escola (Infântil)" ,"E6 - Escola para Portadores de Deficiência", "F1 - Museus, Bibliotecas e Assemelhados " ,"F2 - Local Relogioso ou Velório" ,"F3 - Centro esportivo e de Exibição", "F4 - Estação e Terminais de passageiros" ,"F5 - Arte Cênica" ,"F6 - Clubes Sociais e Afins", "F7 - Construção Provisória" ,"F8 - Local para Refeição" ,"F9 - Recreação Pública", "F10 - Exposiçição de Objetos e Animais" ,"F11 - Auditórios " ,"G1 - Garagens Privadas", "G2 - Garagens com Acesso ao Publico", "G3 - Local dotado de abastacimento de compustivéis", "G4 - Serviço de Manutenção e Reparos", "G5 - Hangares", "G6 - Garagens de serviços de Carga e Coletivos", "H1 - Hospital Veterinário", "H2 - Atendimento a Pessoas com Limitações Físicas e Mentais", "H3 - Hospital e Assemelhado", "H4 - Repartição Publica ou  edificação militar", "H5 - Local Aonde a Liberdade sofre Restriç˜åo", "H6 - Clinicas Médicas, odontólogicas e Veterinárias", "I1 - Industrias com Carga até 300MJ/m²", "I2 - Industrias com Carga entre 300MJ/m² e 1.200MJ/m²", "I3 - Industrias com Carga Superior a 1.200MJ/m²", "J1 - Deposito de Material Incombustivel", "J2 - Deposito com Carga Inferior a 300MJ/m²", "J3 - Deposito com Carga entre 300MJ/m² e 1.200MJ/m²", "J4 - Deposito com Carga superiror a 1.200MJ/m²", "L1 - Comercio de explosivos", "L2 - Industria de explosivos", "L3 - Depósito de explosivos", "M1 - Tuneis", "M2 - Tanques ou Parque de Tanques", "M3 - Central de Comunicação ou Energia", "M4 - Locais em Construção ou Demolição", "M5 - Local de Processamento de Lixo", "M6 - Floresta Selvagem", "M7 - Patio de Containers"]
    
    static var upOcupacaoAcesso: [String] = ["60","60","60","60","100","100","100","100","100","100","100","100","100","100","100","30","30","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","60","30","30","60","60","60","100","100","100","100","100","100","100","100","100","100","100","60","100","100","100","100"]
    static var upOcupacaoEscadas: [String] = ["45","45","45","45","60","60","60","60","60","60","60","60","60","60","22","22","22","75","75","75","75","75","75","75","75","75","75","75","60","60","60","60","60","60","45","30","30","45","45","45","60","60","60","60","60","60","60","60","75","60","60","45","60","75","60","60"]
    
    static var upOcupacaoPortas: [String] = ["100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","30","30","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","30","30","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100","100"]
    
    static var populacao: [Double] = [4, 4, 4, 15, 3, 3, 3, 7, 7, 7, 7, 1.50, 1.50, 1.50, 1.50, 1.50, 3, 1, 2, 2, 1, 2, 2, 1, 1, 3, 1, 20, 20, 20, 20, 20, 20, 7, 4, 7, 4, 4, 7, 10, 10, 10, 30, 30, 30, 30, 3, 10, 10, 10, 10, 10, 4, 10, 10, 10]
    
     static var cargas: [String] = ["300", "300", "300", "500", "200 ou 300", "Entre 700  e 1000", "800", "Entre 200 e 500", "300", "Entre 300 e 600", "Entre 300 e 500", "300", "300", "300", "300", "300", "2000", "200", "150", "200", "600", "600", "500", "300", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "600", "200", "200", "300", "300", "200","Consultar Anexo B, para mais Informações", "300", "350", "300", "450", "100", "200", "300", "Entre 400 e 800", "Entre 1700 e 3000", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações","Consultar Anexo B, para mais Informações","Consultar Anexo B, para mais Informações","Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações", "Consultar Anexo B, para mais Informações"]

}



