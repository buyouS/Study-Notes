"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const bracesAroundFor_1 = require("./bracesAroundFor");
const bracesAroundIfElse_1 = require("./bracesAroundIfElse");
const bracesAroundWhile_1 = require("./bracesAroundWhile");
const forStatementMustHaveAllParts_1 = require("./forStatementMustHaveAllParts");
const noDeclareMutable_1 = require("./noDeclareMutable");
const noDotAbbreviation_1 = require("./noDotAbbreviation");
const noEval_1 = require("./noEval");
const noHolesInArrays_1 = require("./noHolesInArrays");
const noIfWithoutElse_1 = require("./noIfWithoutElse");
const noImplicitDeclareUndefined_1 = require("./noImplicitDeclareUndefined");
const noImplicitReturnUndefined_1 = require("./noImplicitReturnUndefined");
const noNull_1 = require("./noNull");
const noUnspecifiedLiteral_1 = require("./noUnspecifiedLiteral");
const noUnspecifiedOperator_1 = require("./noUnspecifiedOperator");
const noUpdateAssignment_1 = require("./noUpdateAssignment");
const noVar_1 = require("./noVar");
const singleVariableDeclaration_1 = require("./singleVariableDeclaration");
const noTemplateExpression_1 = require("./noTemplateExpression");
const noSpreadInArray_1 = require("./noSpreadInArray");
const rules = [
    bracesAroundFor_1.default,
    bracesAroundIfElse_1.default,
    bracesAroundWhile_1.default,
    forStatementMustHaveAllParts_1.default,
    noDeclareMutable_1.default,
    noDotAbbreviation_1.default,
    noIfWithoutElse_1.default,
    noImplicitDeclareUndefined_1.default,
    noImplicitReturnUndefined_1.default,
    noNull_1.default,
    noUnspecifiedLiteral_1.default,
    noUnspecifiedOperator_1.default,
    noUpdateAssignment_1.default,
    noVar_1.default,
    singleVariableDeclaration_1.default,
    noEval_1.default,
    noHolesInArrays_1.default,
    noTemplateExpression_1.default,
    noSpreadInArray_1.default
];
exports.default = rules;
//# sourceMappingURL=index.js.map